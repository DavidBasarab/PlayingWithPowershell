$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Get-TextFileNames" {
    It "returns one text file" {
        Mock Get-ChildItem {
            [PSCustomObject]@{
                Name = "a812e023.txt"
            }
        }

        Get-TextFileNames | Should Be "a812e023.txt"
    }

    It "should only return txt files" {
        Mock Get-ChildItem {
            [PSCustomObject]@{
                Name = "a812e023.txt"
            },
            [PSCustomObject]@{
                Name = "anotherFile.txt"
            },
            [PSCustomObject]@{
                Name = "ADocFile.doc"
            }
        }

        Get-TextFileNames | Should Be ("a812e023.txt", "anotherFile.txt")
    }
}
