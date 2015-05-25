Set-Alias st "C:\TOOLS\Sublime Text Build 3083 x64\subl.exe"

# sublime project 的目录
#   所有 project 都保存这个目录下，方便控制

$proj = 'F:\st';

# 查看所有 project   `st-proj`
# 打开指定 project   `st-proj fis`
function st-proj {
    Param($p);
    $projs = Get-ChildItem $proj;

    if ($p) {
        $p = '*' + $p + '*.sublime-project';
        # $p = $projs.Where({$_.Name -like $p});
        $p = $projs.Where({$_.FullName -like $p});

        if ($p -and $p[0]) {
            # $path = Join-Path -path $proj -childpath $p[0].Name;
            $path = $p[0];
            # echo $path.FullName;
            if ($path) {
                st $path.FullName -n
            }
        } else {
            Write-Error "can not find proj";
        }
    } else {
        # $projs.Where({$_.Name -like '*sublime-project'}) | Format-Wide -Property Name -Column 1;
        $projs = $projs.Where({$_.Name -like '*sublime-project'});
        $output = @();
        foreach($i in $projs) {
            $output += ("`t" + $i.Name.split('.')[0]);
        }
        "`n";
        $output;
        "`n";
    }
}