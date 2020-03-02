# Autor: Rubén Herreros
# Funciones para recoger la información de los logs. 

function getFilter () {
	typeFilter=$1
	actionFilter=$2
	fileRoute=./databases/filter-tmp.txt
	filterCol=$(getColNumber ${actionFilter})
	echo Id:Usuario:Acción:Repositorio:Mensaje  > ./databases/prefilter-tmp.txt
	while [[ $3 != '' ]];do
		textFilter=$3
		grep "${textFilter}" ./databases/${typeFilter}.log > ${fileRoute}
		let lineNums=$(cat ${fileRoute} | wc -l)
		while [[ ${lineNums} -gt 0 ]];do
			row=$(tail -n ${lineNums} ${fileRoute} | head -n 1)
			word=$(echo ${row} | cut -d: -f${filterCol})			
			if [[ "${word}" == "${textFilter}" ]]; then
				echo ${row} >> ./databases/prefilter-tmp.txt
			fi
			let lineNums=${lineNums}-1
		done
		shift
	done
	grep -v '#' ./databases/prefilter-tmp.txt > ./databases/document-tmp.txt
	getStructure ./databases/document-tmp.txt 5
	unset typeFilter
	unset actionFilter
	unset textFilter
	unset result
}

function getAll () {
	typeFilter=$1
	echo Id:Usuario:Acción:Repositorio:Mensaje  > ./databases/filter-tmp.txt
	grep -v '#' ./databases/${typeFilter}.log >> ./databases/filter-tmp.txt
	cat ./databases/filter-tmp.txt > ./databases/document-tmp.txt
	getStructure ./databases/document-tmp.txt 5
	unset typeFilter
}

function getStructure() {
	fileRoute=$1
	totalCols=$2
	fileTmp=./databases/structured-tmp.txt
	let lineNums=$(cat ${fileRoute} | wc -l)
	while [[ ${lineNums} -gt 0 ]];do
		row=$(tail -n ${lineNums} ${fileRoute} | head -n 1)
		textRow=
		let colNums=1
		while [[ ${colNums} -le ${totalCols} ]];do
			col=$(echo ${row} | cut -d: -f${colNums})
			charNums=$(echo ${col} | wc -m)
			textRow=${textRow}${col}
			let zeroChar=15-${charNums}
			while [[ ${zeroChar} -ge 0 ]];do
				textRow="${textRow} "
				let zeroChar=${zeroChar}-1
			done
			let colNums=${colNums}+1
		done
		let lineNums=${lineNums}-1
		echo "${textRow} " >> ${fileTmp}
	done
	cat ${fileTmp}
	unset fileRoute
	unset fileTmp
	unset lineNums
	unset row
	unset colNums
	unset charNums
	unset textRow
	unset zeroChar
	unset col
}

function getGraphic() {
	logType=$1
	filterType=$2
	filterCol=$(getColNumber ${filterType})

	grep -v '#' ./databases/${logType}.log > ./databases/filter-tmp.txt
	cut -d: -f${filterCol} ./databases/filter-tmp.txt > ./databases/cuted-tmp.txt
	cat ./databases/cuted-tmp.txt > ./databases/filter-tmp.txt
	echo ${filterType}:Operaciones:Total  > ./databases/prefilter-tmp.txt
    	setDifferents
	
	let lineNums=$(cat ./databases/differents.txt | wc -l)
	while [[ ${lineNums} -gt 0 ]];do
		row=$(tail -n $lineNums ./databases/differents.txt | head -n 1)
		if [[ "${row}" != "" ]]; then
			grep ${row} ./databases/filter-tmp.txt > ./databases/filtered-tmp.txt
			let filteredNums=$(cat ./databases/filtered-tmp.txt | wc -l)
			let symbolNum=(${filteredNums}/10)+1
			symbolText=			
			while [[ ${symbolNum} -gt 0 ]];do
				symbolText=${symbolText}X
				let symbolNum=${symbolNum}-1
			done
			echo ${row}:${symbolText}:${filteredNums} >> ./databases/prefilter-tmp.txt
		fi
		let lineNums=${lineNums}-1
	done

	getStructure ./databases/prefilter-tmp.txt 3

	unset logType
	unset filterType	
}

function setDifferents() {
	fileRoute=./databases/filter-tmp.txt
	echo "" > ./databases/differents.txt
	let lineNums=$(cat ${fileRoute} | wc -l)
	while [[ ${lineNums} -gt 0 ]];do
		row=$(tail -n ${lineNums} ${fileRoute} | head -n 1)
		created=$(grep ${row} ./databases/differents.txt)
		if [[ "${created}" == "" ]]; then
			echo ${row} >> ./databases/differents.txt
		fi
		let lineNums=${lineNums}-1
	done
}

function getColNumber() {
	colTitle=$1
	colNum=0
	if [[ "${colTitle}" == "Id" ]]; then
		colNum=1
	elif [[ "${colTitle}" == "Usuario" ]]; then
		colNum=2
	elif [[ "${colTitle}" == "Acción" ]]; then
		colNum=3
	elif [[ "${colTitle}" == "Mensaje" ]]; then
		colNum=4
	fi
	echo ${colNum}
	unset colTitle
	unset colNum
}

function createFile() {
	saveRoute=$1
	typeFile=$2
	mv ./databases/structured-tmp.txt "${saveRoute}/resumen_${typeFile}.txt"
	unset saveRoute
	unset typeFile
}

function deleteFile() {
	if [[ -f "./databases/filter-tmp.txt" ]]; then
		rm ./databases/filter-tmp.txt
	fi

	if [[ -f "./databases/document-tmp.txt" ]]; then
		rm ./databases/document-tmp.txt
	fi

	if [[ -f "./databases/structured-tmp.txt" ]]; then
		rm ./databases/structured-tmp.txt
	fi

	if [[ -f "./databases/prefilter-tmp.txt" ]]; then
		rm ./databases/prefilter-tmp.txt
	fi

	if [[ -f "./databases/differents.txt" ]]; then
		rm ./databases/differents.txt
	fi

	if [[ -f "./databases/filtered-tmp.txt" ]]; then
		rm ./databases/filtered-tmp.txt
	fi

	if [[ -f "./databases/cuted-tmp.txt" ]]; then
		rm ./databases/cuted-tmp.txt
	fi
}