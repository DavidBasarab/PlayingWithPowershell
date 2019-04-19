function Get-TextFileNames {
    Get-ChildItem | Where Name -like *.txt | Select -ExpandProperty Name
}
