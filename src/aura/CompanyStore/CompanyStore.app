<aura:application >
<ltng:require scripts="{!join(',',
                       $Resource.companystore + '/companystore/jquery-3.1.1.min.js',
                       $Resource.companystore + '/companystore/bootstrap/bootstrap.js')}" 
              styles="{!join(',',
                      $Resource.companystore + '/companystore/style.css',
                      $Resource.companystore + '/companystore/bootstrap/bootstrap.css' 
                     
                      )}"
              
             />
<c:ProductViewer />
</aura:application>