$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "HelloWorld" {
    It "returns a canonical phrase" {
        HelloWorld | Should Be "Hello from Pester"
    }

    It "with a name will say hello to that name" {
        HelloWorld "Venus" | Should Be "Hello from Venus"
    }
}
