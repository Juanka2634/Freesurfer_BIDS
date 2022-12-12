#!/bin/bash/

#Script creado por: Juan Quizhpilema

#Este script permitira ejecutar de forma rápida el análisis de freesurfer con la opción de agregar imágenes
#poteciadas en T2w para mejorar el resultado.

echo -n "El directorio de salida actual de freesurfer es el siguiente: \n"
	echo $SUBJECTS_DIR

while true; 
do
	read -p "Deseas cambiar la ruta de salida de freesurfer? (y/n) " yn

	case $yn in
	[Yy] ) echo -n Ingresar ruta de salida de freesurfer: ;
		read -r subjects_id
		echo $subjects_id
		if [ ! -d "$subjects_id" ] ;then
			echo "El directorio de salida no existe, creando uno nuevo en la ruta indicada...."
			mkdir $subjects_id
		fi
		export SUBJECTS_DIR=${subjects_id}
		break;;
	[nN] ) echo El directorio de salida no se ha cambiado se mantiene el actual;
		echo $SUBJECTS_DIR;;
* ) echo invalid response;;
esac

done

echo "Ingrese la ruta del direrctorio BIDS"
read -r bids_root

while true;
do
	read -p "Se agrega una imagen potenciada en T2? (y/n) " yn

	case $yn in
	[Yy] ) echo Ingrese el nombre de la carpeta donde se encuentra la imagen: ;
		read -r t2_root
		echo $t2_root
		echo "Ingrese el patron de la imagen T2 (ejm. *t2tseaxial.nii.gz)"
		read -r t2_pattern
		echo $t2_pattern
	break;;
	[nN] ) echo Imagen T2 no agregada;;
* ) echo invalid response;;
esac
done

echo $SUBJECTS_DIR
echo $subjects_id
echo $bids_root
echo $t2_root
echo $t2_pattern
echo $bids_root/participants.tsv

mkdir $subjects_id/tmp
cut -f 1 $bids_root/participants.tsv > $subjects_id/tmp/tmp_ids

for x in `cat tmp_ids`
do
	
done

#while true; 
#do
#	read -p "Deseas cambiar la ruta de salida de freesurfer? (y/n) " yn
#	case $yn in
#
#	[Yy] ) echo ok, ingresa la nueva ruta;
#		
#		break;;
#	[nN] ) echo exiting...;
#		exit;;
#* ) echo invalid response;;
#esac
#
#done
  
