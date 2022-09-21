$pat = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":iyj3a262zaa33swytf55j3hwczjwyf2tytnsqvizt3mlaktnfpma"))
        
write-host "Auth print"

$body =@{
 templateParameters = @{ sprint_number= "100" }
}| ConvertTo-Json
      
   $body = "{'parameters':'{'Test1':9}','definition':{'id': 68},'templateParameters': {'Test_Paraj': 'test'}}"

$body = "{'resources': {'repositories': {'self': {'refName': 'refs/heads/master'}}},'templateParameters':{'Test_Paraj': 'Test'}}"   

$bodyJson=$body | ConvertFrom-Json



   $bodyString=$bodyJson | ConvertTo-Json -Depth 100
write-host $body

try {

$params = @{'Uri' = ('https://hlsi01-poc.visualstudio.com/USHC_AMER_US_ADU_HSP_Ua3/_apis/pipelines/68/runs?api-version=6.0-preview.1')
'Headers'= @{'Authorization' = 'Basic ' + $pat}
'Method'= 'Post'
'ContentType' = 'application/json'
'Body'= $bodyString
}
$result = Invoke-RestMethod @params
write-host $result
}
catch {
 Write-Host "An error occurred:"
 Write-Host $_.Exception
}