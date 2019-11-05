#!/bin/bash

#------------FUNCIONES----------#
function menu
clear
echo "1) Numero inverso"
echo "2) Palindromo"	
echo "3)Ordenar numeros"
echo "5) Salir saludando"

#-----------------main-----------------------

menu

while true; do
	read -p "Ingrese opcion a ejecutar" opcion
	case $opcion in
		1)
			NUM=0
			read -p "Ingrese numero a invertir" NUM
			echo $NUM | rev;;
		2)
			read -p "Ingrese cadena de caracteres" cadena
			cadena_inver=`echo $cadena | rev`
			if[ $cadena = $cadena_inver]
			then
				echo "Es palindromo"
			else
				echo "No es palindromo"
			fi;;
		3)
			echo "ingrese 5 numeros"
			for((i=1;i<=5;i++))
				do
					read -p "Numero $i: " numero$i
				done

			echo -e "$numero1 $numero2 $numero3 $numero4 $numero5"
	esac
done
exit 0
