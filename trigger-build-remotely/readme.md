#this script will automatically fetch the job url

Note:
   token-name and job name should be same
   Manually create the API token and store in a secretfile
   update jenkins url in crumb

share the final url in mail to approve the build.

Sample execution:
+ job=main-folder/job/sub-folder/job/params
++ echo job/main-folder/job/sub-folder/job/params
+ job_path=job/main-folder/job/sub-folder/job/params
++ awk -F/ '{print $NF}'
++ echo main-folder/job/sub-folder/job/params
+ job_name=params
++ sed 's/http:\/\///g'
++ echo 'http://epc.australiaeast.cloudapp.azure.com:8389/job/main-folder/job/sub-folder/job/params/build?token=params'
+ complete_path='epc.australiaeast.cloudapp.azure.com:8389/job/main-folder/job/sub-folder/job/params/build?token=params'
++ echo admin:11b8c5d4c234d0659a995fd3602343d62c
+ cred=admin:11b8c5d4c234d0659a995fd3602343d62c
++ wget -q --auth-no-challenge --user admin --password admin --output-document - 'http://epc.australiaeast.cloudapp.azure.com:8389/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)'
+ crumb=Jenkins-Crumb:efa6f821e58d15e657b5145b942357c8c75683992566aaa2048b4a0550175cd7
++ echo 'curl -I -X POST http://admin:11b8c5d4c234d0659a995fd3602343d62c@epc.australiaeast.cloudapp.azure.com:8389/job/main-folder/job/sub-folder/job/params/build?token=params -H "Jenkins-Crumb:efa6f821e58d15e657b5145b942357c8c75683992566aaa2048b4a0550175cd7"'
+ final_url='curl -I -X POST http://admin:11b8c5d4c234d0659a995fd3602343d62c@epc.australiaeast.cloudapp.azure.com:8389/job/main-folder/job/sub-folder/job/params/build?token=params -H "Jenkins-Crumb:efa6f821e58d15e657b5145b942357c8c75683992566aaa2048b4a0550175cd7"'