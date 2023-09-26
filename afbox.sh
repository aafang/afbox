#!/bin/bash
Font_Black="\033[30m"
Font_Red="\033[31m"
Font_Green="\033[32m"
Font_Yellow="\033[33m"
Font_Blue="\033[34m"
Font_Purple="\033[35m"
Font_SkyBlue="\033[36m"
Font_White="\033[37m"
Font_Suffix="\033[0m"

# from bbr脚本
function check_sys(){
	  if [[ -f /etc/redhat-release ]]; then
	    release="centos"
	  elif grep -qi "debian" /etc/issue; then
	    release="debian"
	  elif grep -qi "ubuntu" /etc/issue; then
	    release="ubuntu"
	  elif grep -qi -E "centos|red hat|redhat" /etc/issue || grep -qi -E "centos|red hat|redhat" /proc/version; then
	    release="centos"
	  fi
	
	  if [[ -f /etc/debian_version ]]; then
	    OS_type="Debian"
	    echo "检测为Debian通用系统，判断有误请反馈"
	  elif [[ -f /etc/redhat-release || -f /etc/centos-release || -f /etc/fedora-release ]]; then
	    OS_type="CentOS"
	    echo "检测为CentOS通用系统，判断有误请反馈"
	  else
	    echo "Unknown"
	  fi
	  sleep 2
}

function get_char()
{
	SAVEDSTTY=`stty -g`
	stty -echo
	stty cbreak
	dd if=/dev/tty bs=1 count=1 2> /dev/null
	stty -raw
	stty echo
	stty $SAVEDSTTY
}

function bbr_m(){
	while true
	do
		clear
		echo "--------------------------------------------------"
		echo " BBR加速管理"
		echo "--------------------------------------------------"
		echo "1、卸载内核版"
		echo "2、不卸载内核版"
		echo "0、返回主菜单"
		echo "--------------------------------------------------"
		echo -n "请选择："
		read aNum2
		case $aNum2 in
		1)  echo "开始运行卸载内核版"
			if [ -f "/etc/afbox/tcp.sh" ];then
	     		echo "脚本已存在，继续执行"
	     		bash /etc/afbox/tcp.sh
	     	else
				wget -N --no-check-certificate "https://github.000060000.xyz/tcp.sh" -P /etc/afbox/ && chmod +x /etc/afbox/tcp.sh && bash /etc/afbox/tcp.sh
			fi
	     ;;
	     2)  echo "开始运行不卸载内核版"
	     	if [ -f "/etc/afbox/tcpx.sh" ];then
	     		echo "脚本已存在，继续执行"
	     		bash /etc/afbox/tcpx.sh
	     	else
				wget -N --no-check-certificate "https://github.000060000.xyz/tcpx.sh" -P /etc/afbox/ && chmod +x /etc/afbox/tcpx.sh && bash /etc/afbox/tcpx.sh
			fi
	     ;;
	     0)
	     	break
     	;;
     	*)  echo -e "${Font_Red}输入错误，请重新输入${Font_Suffix}"
     		sleep 2
     	;;
     	esac
     done
}

function test_m(){
	while true
	do
		clear
		echo "--------------------------------------------------"
		echo " 服务器各项测试"
		echo "--------------------------------------------------"
		echo "1、服务器基本信息 By yabs.sh"
		echo "2、流媒体解锁测试 By lmc999"
		echo "3、服务器带宽测试 By i-abc"
		echo "4、服务器硬盘测试 By yabs.sh"
		echo "5、回程路由测试GO版 By zhanghanyun"
		echo "6、回程路由测试AT版 By Chennhaoo"
		echo "7、服务器CPU跑分 By yabs.sh"
		echo "8、NodeBench一键测评 By 酒神"
		echo "0、返回主菜单"
		echo "--------------------------------------------------"
		echo -n "请选择："
		read aNum2
		case $aNum2 in
		1)  wget -qO- yabs.sh | bash -s -- -gif
     		echo "按任意键继续!"
			char=`get_char`
	     ;;
	     2) bash <(curl -L -s check.unlock.media)
     		echo "按任意键继续!"
			char=`get_char`
	     ;;
	     3) bash <(curl -sL bash.icu/speedtest)
     		echo "按任意键继续!"
			char=`get_char`
	     ;;
	     4) wget -qO- yabs.sh | bash -s -- -gi
     		echo "按任意键继续!"
			char=`get_char`
	     ;;
	     5) curl https://raw.githubusercontent.com/zhanghanyun/backtrace/main/install.sh -sSf | sh
     		echo "按任意键继续!"
			char=`get_char`
	     ;;
	     6) if [ -f "/etc/afbox/AutoTrace.sh" ];then
	     	bash /etc/afbox/AutoTrace.sh
	     	else
	     	wget -N --no-check-certificate https://raw.githubusercontent.com/Chennhaoo/Shell_Bash/master/AutoTrace.sh -P /etc/afbox/ && chmod +x /etc/afbox/AutoTrace.sh
	     	bash /etc/afbox/AutoTrace.sh
	     	fi
     		echo "按任意键继续!"
			char=`get_char`
	     ;;
	     7) wget -qO- yabs.sh | bash -s -- -if
     		echo "按任意键继续!"
			char=`get_char`
	     ;;
	     8) bash <(curl -sL https://raw.githubusercontent.com/LloydAsp/NodeBench/main/NodeBench.sh)
     		echo "按任意键继续!"
			char=`get_char`
	     ;;
	     0)
	     	break
     	;;
     	*)  echo -e "${Font_Red}输入错误，请重新输入${Font_Suffix}"
     	sleep 2
     	;;
     	esac
     done
}
function docker_i(){
	wget -qO- get.docker.com | bash
	if [ -x "$(command -v docker)" ]; then
		echo 'Docker 安装失败'
	else
		echo 'Docker 安装成功'
		systemctl start docker
		systemctl enable docker
	fi
}

function docker_m(){
	while true
	do
		clear
		echo "--------------------------------------------------"
		echo "Docker管理"
		echo "--------------------------------------------------"
		echo "1、安装Docker"
		echo "2、安装Docker-compose"
		echo "3、Docker容器管理"
		echo "4、Docker镜像管理"
		echo "0、返回主菜单"
		echo "--------------------------------------------------"
		echo -n "请选择："
		read aNum2
		case $aNum2 in
		1)  echo "开始安装Docker"
			if [ -x "$(command -v docker)" ]; then
				echo "Docker 已安装，无需重复安装"
				echo "按任意键继续!"
				char=`get_char`
			else
				docker_i
			fi
				
	     ;;
	     2)  echo "开始安装Docker-compose"
	     	curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
			chmod +x /usr/local/bin/docker-compose
	     ;;
	     3)  echo "以下是您的容器列表"
	     	ids=($(docker ps -a --format "{{.ID}}"))
			images=($(docker ps -a --format "{{.Image}}"))
			cmds=($(docker ps -a --format "{{.Command}}"))
			createds=($(docker ps -a --format "{{.CreatedAt}}"))
			statuses=($(docker ps -a --format "{{.Status}}"))
			ports=($(docker ps -a --format "{{.Ports}}"))
			names=($(docker ps -a --format "{{.Names}}"))
			container_ids_arr=($(docker ps -a --format "{{.ID}}"))
			container_count=${#ids[@]}
			printf  "%-4s %-16s %-36s %-24s %-16s %-16s %-24s %s\n" "ID" "CONTAINER ID" "IMAGE" "COMMAND" "CREATED" "STATUS" "PORTS" "NAMES"
			for ((i=0; i<$container_count; i++)); do
			   printf "%-4s %-16s %-36s %-24s %-16s %-16s %-24s %s\n" \
			         "${i}" \
			         "${ids[$i]}" \
			         "${images[$i]}" \
			         "${cmds[$i]}" \
			         "${createds[$i]}" \
			         "${statuses[$i]}" \
			         "${ports[$i]}" \
			         "${names[$i]}"
			done
			echo -n "请输入您要操作的容器ID："
			read c_id
			if [ -z "$c_id" ];then
				echo "无输入，按任意键继续!"
				char=`get_char`
			else
				echo -n -e "1、重启\t2、停止\t3、设置开启自启\t4、取消开机自启\t5、删除\n请选择："
				read x_id
				case $x_id in
				1) docker restart "${ids[$c_id]}"
				echo "重启成功，按任意键继续!"
				char=`get_char`
				;;
				2) docker stop "${ids[$c_id]}"
				echo "停止成功，按任意键继续!"
				char=`get_char`
				;;
				3) docker update --restart=always "${names[$c_id]}"
				echo "设置成功，按任意键继续!"
				char=`get_char`
				;;
				4) docker update --restart=no "${names[$c_id]}"
				echo "设置成功，按任意键继续!"
				char=`get_char`
				;;
				5) 	echo -n "是否要删除？ [Y/N]："
					read answer
					case $answer in
					[yY] )
					docker stop "${ids[$c_id]}" && docker rm "${ids[$c_id]}"
					echo "删除成功，按任意键继续!"
					char=`get_char`
					;;
					* )
					echo "用户取消，按任意键继续!"
					char=`get_char`
					;;
					esac
				;;
				*)  echo -e "${Font_Red}输入错误，请重新输入${Font_Suffix}"
     				sleep 2
     			;;
				esac
			fi
			
	     ;;
	     4)  echo "以下是您的镜像列表"
			ids=($(docker images --format "{{.ID}}"))
			repos=($(docker images --format "{{.Repository}}"))
			tags=($(docker images --format "{{.Tag}}"))
			sizes=($(docker images --format "{{.Size}}"))
			
			image_count=${#ids[@]}
			printf "%-4s %-16s %-24s %-16s %s\n" "ID" "IMAGE ID" "REPOSITORY" "TAG" "SIZE"
			for ((i=0; i<$image_count; i++)); do
			   printf "%-4s %-16s %-24s %-16s %s\n" \
			         "${i}" \
			         "${ids[$i]}" \
			         "${repos[$i]}" \
			         "${tags[$i]}" \
			         "${sizes[$i]}"
			done
			
			echo -n "请输入您要操作的镜像ID："
			read img_id
			image_id=${ids[$img_id]}
			
			echo -n "请选择操作：(b)uild 或者 (d)elete "
			read operation
			
			case $operation in
			    "b" | "B" | "build" | "Build")
			        echo "请输入构建配置文件路径（例如：Dockerfile）："
			        read docker_file
			        echo "请输入构建上下文路径（例如：.表示当前目录）："
			        read context_path
			        echo "请输入目标镜像名称（例如：myimage:v1）："
			        read image_name
			        docker build -t $image_name -f $docker_file $context_path
			        echo "构建完成"
			        ;;
			
			    "d" | "D" | "delete" | "Delete")
			        docker rmi $image_id
			        echo "删除完成"
			        ;;
			
			    *)
			        echo "未知操作，退出"
			        ;;
			esac
	     ;;
	     0)
	     	break
     	;;
     	*)  echo -e "${Font_Red}输入错误，请重新输入${Font_Suffix}"
     	sleep 2
     	;;
     	esac
     done
}

function nezha_m(){
	if [ -f "/etc/afbox/nezha.sh" ];then
		bash /etc/afbox/nezha.sh
	else
		curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh  -o/etc/afbox/nezha.sh && chmod +x /etc/afbox/nezha.sh
		bash /etc/afbox/nezha.sh
	fi
}

function warp_m(){
	if [ -f "/etc/afbox/menu.sh" ];then
		bash /etc/afbox/menu.sh
	else
		wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh -P /etc/afbox/ && bash /etc/afbox/menu.sh
	fi
}

function htm5_s(){
	if ! [ -x "$(command -v docker)" ]; then
		echo 'Docker 还未安装，开始安装'
		docker_i
	else
		docker run --restart=always -d -p 6688:80 ilemonrain/html5-speedtest:alpine
		echo "安装完成，按任意键继续!"
		char=`get_char`
	fi
}

function ptbox_m(){
		clear
		echo "--------------------------------------------------"
		echo "QuickBox Lite安装"
		echo "--------------------------------------------------"
		echo -n "用户名(默认Admin)："
		read username
		if [ -z "$username" ];then
			username="Admin"
		fi
		echo -n "密码(默认Admin123)："
		read password
		if [ -z "$password" ];then
			password="Admin123"
		fi
		echo -n "SSH端口密码(默认22)："
		read ssh_port
		if [ -z "$ssh_port" ];then
			ssh_port="22"
		fi
		echo -n "安装后自动重启？ [Y/N]："
		read answer1
		case $answer1 in
			[yY] )
				arg1="--reboot"
			;;
			* )
				arg1=""
			;;
		esac
		echo "开始安装……"
		bash <(wget -qO- https://git.io/qbox-lite -o /dev/null) -u ${username} -p ${password} --with-ffmpeg -P ${ssh_port} --with-deluge --with-mktorrent --with-linuxrar --with-cf --hostname vmserver ${arg1}
		echo "安装完成，按任意键继续!"
		char=`get_char`
}

function speed_limit(){
	while true
	do
			clear
			echo "--------------------------------------------------"
			echo "网卡限速管理"
			echo "--------------------------------------------------"
			echo "1、安装限速和监控插件"
			echo "2、设置网卡限速"
			echo "3、取消网卡限速"
			echo "4、查看网卡监控"
			echo "0、返回主菜单"
			echo "--------------------------------------------------"
			echo -n "请选择："
			read aNum2
			case $aNum2 in
			1)
				case $OS_type in
				    Debian)
				        apt-get update
				        sudo apt-get install make ethstatus
				        git clone https://github.com/magnific0/wondershaper.git  && cd wondershaper && sudo make install ; cd .. && rm -rf wondershaper
				        ln /usr/local/sbin/wondershaper /sbin/wondershaper
				        echo "安装完成，按任意键继续!"
					   char=`get_char`
				        ;;
				    CentOS)
				        yum install epel-release make ethstatus
				        git clone https://github.com/magnific0/wondershaper.git  && cd wondershaper && sudo make install ; cd .. && rm -rf wondershaper
				        echo "安装完成，按任意键继续!"
					   char=`get_char`
				        ;;
				    *)
				        echo "不支持此系统请尝试手动安装 wondershaper"
				        ;;
				esac
			;;
			2) echo "--------------------------------------------------"
				echo -n "网卡名称："
				read dev_name
				echo -n "上行速率(kbps，留空不限制)："
				read up_speed
				echo -n "下线速率(kbps，留空不限制)："
				read down_speed
				wondershaper -c -a ${dev_name}
				if [ -n "$up_speed" ] && [ -n "$down_speed" ];then
					wondershaper -a ${dev_name} -d ${down_speed} -u ${up_speed}
				elif [ -n "$up_speed" ];then
					wondershaper -a ${dev_name} -u ${up_speed}
				elif [ -n "$up_speed" ];then
					wondershaper -a ${dev_name} -d ${down_speed}
				else
					echo "无限速"
				fi
				echo "限速完成。按任意键继续"
				char=`get_char`
			;;
			3) echo "--------------------------------------------------"
				echo -n "网卡名称："
				read dev_name
				wondershaper -c -a ${dev_name}
				echo "限速完成。按任意键继续"
				char=`get_char`
			;; 
			4) echo "--------------------------------------------------"
				echo -n "网卡名称："
				read dev_name
				ethstatus -i ${dev_name}
			;;
			0) break
			;;
			*)  echo -e "${Font_Red}输入错误，请重新输入${Font_Suffix}"
		     	sleep 2
		     ;;
			esac
	done
}

function clean_log(){
	while true
	do
		clear
		echo "--------------------------------------------------"
		echo "日志文件清理"
		echo "--------------------------------------------------"
		echo "1、Docker日志清理"
		echo "2、系统日志清理"
		echo "0、返回主菜单"
		echo "--------------------------------------------------"
		echo -n "请选择："
		read aNum2
		case $aNum2 in
		1)	echo "--------------------------------------------------"
			d_logs=$(find /var/lib/docker/containers/ -name *-json.log)  
			for log in $d_logs  
			        do  
			                echo "clean logs : $log"  
			                cat /dev/null > $log  
			        done 
			echo "清理完成。按任意键继续"
			char=`get_char`
		;;
		2) 	echo "--------------------------------------------------"
			echo -n "设置日志过期时间(单位:d)："
			read c_time
			echo -n "设置日志文件大小(单位:M)："
			read l_size
			if [ -n "$c_time" ] && [ -n "$l_size" ];then
				journalctl --vacuum-time=${c_time}d && journalctl --vacuum-size=${l_size}M && systemctl restart systemd-journald.service
				echo "清理完成。按任意键继续"
				char=`get_char`
			else 
				echo "请输入所有参数。按任意键继续"
				char=`get_char`
			fi
		;;
		0) break
		;;
		*)  echo -e "${Font_Red}输入错误，请重新输入${Font_Suffix}"
     		sleep 2
     	;;
		esac
	done
}


function menu(){
	clear
	echo "--------------------------------------------------"
	echo "Af_Box 常用脚本工具箱 v0.0.4"
	echo "--------------------------------------------------"
	printf "%-32s %s\n" "1、BBR管理" "2、服务器测试"
	printf "%-32s %s\n" "3、Docker管理" "4、哪吒探针管理"
	printf "%-32s %s\n" "5、Warp管理" "6、网卡限速管理"
	printf "%-32s %s\n" "7、Alist安装" "8、QuickBox_Lite安装"
	printf "%-32s %s\n" "9、Html5_Speedtest安装" "10、日志文件清理"
	echo "0、退出脚本"
	echo "--------------------------------------------------"
	echo "若中途有输入错误，按ctrl+backspace删除"
	echo "--------------------------------------------------"
}

# ====================================================
check_sys
[[ "${OS_type}" == "Debian" ]] && [[ "${OS_type}" == "CentOS" ]] && echo -e "本脚本不支持当前系统" && exit 1
if [ ! -d "/etc/afbox/" ];then
  mkdir /etc/afbox/
else
  echo "文件夹已经存在，继续执行"
fi
while true
do
	menu
	echo -n "请选择："
	read aNum1
	case $aNum1 in
	1)  bbr_m
     ;;
     2)  test_m
     ;;
     3)  docker_m
     ;;
     4)  nezha_m
     ;;
     5)  warp_m
     ;;
     6)  speed_limit
     ;;
     7)  curl -fsSL "https://alist.nn.ci/v2.sh" | bash -s install
     ;;
     8)  ptbox_m
     ;;
     9)  htm5_s
     ;;
	10) clean_log
	;;
     0)  echo "用户选择退出"
	     break
     ;;
     *)  echo -e "${Font_Red}输入错误，请重新输入${Font_Suffix}"
     	sleep 2
     ;;
     esac
done
