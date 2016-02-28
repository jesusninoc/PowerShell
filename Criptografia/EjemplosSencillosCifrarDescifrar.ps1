#script1
"PowerShell"|%{for ($i=0;$i -lt $_.Length; ++$i) { $_[$i] }}

#script2
[string]$a="En cierto lugar de la mancha"
for($i=0; $i -lt $a.Length; $i=$i+1)
{([int]$a[$i])}

#script3
[string]$a="En cierto lugar de la mancha"
for($i=0; $i -lt $a.Length; $i=$i+1)
{([int]$a[$i])+1}

#script4
[string]$a="En cierto lugar de la mancha"
for($i=0; $i -lt $a.Length; $i=$i+1)
{[char]([int]$a[$i]+1)}

#script5
function cifrar($a)
{
for($i=0; $i -lt $a.Length; $i=$i+1)
{[char]([int]$a[$i]+1)}
}
[string]$a="En cierto lugar de la mancha"
$b=cifrar($a)
$b

#script6
function descifrar($a)
{
for($i=0; $i -lt $a.Length; $i=$i+1)
{[char]([int]$a[$i]-1)}
}
$ad=descifrar($b)
$ad
