function Get-TextFileNames {
    Get-ChildItem | Select -ExpandProperty Name
}
