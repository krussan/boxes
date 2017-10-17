STATUS=0
while [ $STATUS != "200" ] && [ $STATUS != "403" ]; do
	sleep 5
	STATUS=`curl --silent -o /dev/null -w '%{http_code}' http://127.0.0.1:8080/`
	printf $STATUS
	printf ".."
done

echo "Done"