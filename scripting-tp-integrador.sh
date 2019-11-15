#!/bin/bash

#TP INTEGRADOR
#HACER UN SCRIPT CON LAS SIGUIENTES CONSIGNAS
#1)Pedir un numero entero y mostrar esa cantidad de elementos de la sucesion de fibonaccio
#2)Pedir un numero entero y mostrar por pantalla ese numero en forma invertida
#3)Pedir una cadena de caracteres y evaluar si es palindromo o no.
#4)Pedir el path a un archivo de texto y mostrar por pantalla la cantidad de lineas que tiene
#5)Pedir 5 numeros enteros y mostrarlos ordenados
#6)Pedir path a un directorio y mostrar por pantalla cuantos archivos tiene de cada tipo
#7)Salir del sistema saludando al usuario


#-------------Funciones-------------

function mostrar_menu(){
	clear
	echo "1 Fibonacci"
	echo "2 Numero invertido"
	echo "3 Palindromo"
	echo "4 Lineas de un archivo"
	echo "5 Ordenar enteros"
	echo "6 Archivos de cada tipo"
	echo "7 salir"
	echo " "
	echo " "
}

function salir(){
	nom=$1
	echo "chau $nom"
	sleep 3
}

function fibonacci(){
	cant=$1
	aux=1
	aux2=1
	echo $aux
	if [ $1 -gt 1 ]
	then
		echo $aux2
	fi

	for((i=3;i<=cant;i++))
		do
			val=`expr $aux + $aux2`
			echo $val
			aux=$aux2
			aux2=$val
		done

}

#-------------------MAIN--------------------#
opcion=0
mostrar_menu

while true; do
	read -p "INGRESE OPCION" opcion
	case $opcion in
	1)
		num=0
		read -p "Ingrese numero para hacer sucecion de fibonacci" num
		fibonacci $num;;
	2)
		num=0
		read -p "Ingrese numero" num
		echo $num | rev;;
	3)
		read -p "Ingrese cadena a evaluar" cad
		invertida=`echo $cad | rev`
		if [ $cad=$invertida ]
		then
			echo "La cadena es palindormo"
		else
			echo "La cadena no es palindormo"
		fi;;
	4)
		read -p "ingrese ruta de un archivo de texto" ruta
		if [ -f $ruta ]
		then
			cant_lineas=`cat $ruta | wc -l`
			echo "lieas del archivo:  $cant_lineas"
		else
			echo "La ruta ingresada no es un archivo"
		fi;;
	5)
		echo "Ingrese 5 numeros"
		for((i=1;i<5;i++))
			do
				read -p "Ingrese numero $i: " numero$i
			done
		echo -e "$numero1,$numero2,$numero3,$numero4,$numero5" | sort -n ;;

	6)
		read -p "Ingrese ruta de directorio: " ruta
		if [ -d ruta ]
		then
			find $ruta -type f | sed -n 's/..*\.//p' |sort |uniq -c
		else
			echo "No existe directorio"
		fi	;;
	7)
		salir `whoami`
		break;;
	*)
		echo "Ingrese opcion de 1 a 7";;
	esac
done
exit 0


