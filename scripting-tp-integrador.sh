#!/bin/bash

function mostrar_menu(){
clear
echo "1)fibonacci"
echo "2)numero invertido"
echo "3)palindromo"
echo "4)cantidad de lineas de un path"
echo "5)ordenar numeros"
echo "6)tipos de archivos del path"
echo "7)salir"
}
mostrar_menu
function saludar(){
NOMBRE=$1
echo "Chau $NOMBRE"
sleep 2
}

function fibonacci(){
echo "ingrese numero"
read N
a=0
b=1
clear
echo "La serie de fibonacci es: "
for((i=0;i<$N;i++))
do
	echo "$a"
	fn=$((a + b))
	a=$b
	b=$fn
done
}

function invertir(){
echo "ingresar numero a invertir"
read  n
echo $n | rev
}

function cant_lineas(){
echo "Ingrese el path"
read p
echo "la cantidad de lineas del path es de: "
wc -l $p
}

function ordenar2(){
array=()
echo "Ingrese los 5 numeros a ordenar"
read -a array
echo ${array[*]} | tr " " "\n" | sort -n | tr " " "\n"
}

#function ordenar(){
#echo "Ingrese 5 numeros: "
#read a
#read b
#read c
#read d
#read e
#declare -a array=($a $b $c $d $e)
#
#echo ${array[*]}
#for((i = 0; i<5; i++))
#do
#	for((j = i; j<5-i-1; j++))
#	do
#		if((${array[j]} > ${array[$((j+1))]}))
#		then
#			temp = ${array[$j]}
#			array[$j] = ${array[$((j+1))]}
#			array[$((j+1))] = $temp
#		fi
#	done
#done
#echo ${array[*]}
#}

function tipo_archivo(){
read -p "ingrese path" path
	echo $(ls -q -U $path | awk -F . '{print $AB}' | sort | uniq -c | awk '{print $2,$1}')
}

function palindromo(){
read -p "ingresar palabra para verificar si es palindroma: " palabra
palabraInversa=$(echo $palabra | rev)
if [ $palabraInversa = $palabra ]
then
echo "Es un palindromo"
else
echo "No es un palindromo"
fi
}

OPCION=0
mostrar_menu
while true; do
	read -p "ingrese una opcion: " OPCION
	case $OPCION in
		1) fibonacci ;;
		2) invertir ;;
		3) palindromo ;;
		4) cant_lineas ;;
		5) ordenar2 ;;
		6) tipo_archivo ;;
		7) saludar ;;
	esac
done
exit 0