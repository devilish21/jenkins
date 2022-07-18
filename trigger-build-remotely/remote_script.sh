job=$(echo $JOB_NAME | sed 's/\//\/job\//g')
job_path=$(echo "job/$job")
job_name=$(echo $job | awk -F/ '{print $NF}')

# get the job url
complete_path=$(echo "$JENKINS_URL$job_path/build?token=$job_name" | sed 's/http:\/\///g')

#create a api token in jenkins
cred=$(echo "admin:11b8c5d4c234d0659a995fd3602343d62c")

#creating the crumb
crumb=$(wget -q --auth-no-challenge --user admin --password admin --output-document - 'http://epc.australiaeast.cloudapp.azure.com:8389/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')

#final command to execute the build
final_url=$(echo "curl -I -X POST http://$cred@$complete_path -H \"$crumb\"")