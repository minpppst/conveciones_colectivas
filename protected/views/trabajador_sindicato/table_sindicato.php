<?php
/* @var $this Trabajador_sindicatoController */
/* @var $model Trabajador_sindicato */

$this->breadcrumbs=array(
	'Trabajador Sindicatos'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Trabajador_sindicato', 'url'=>array('index')),
	array('label'=>'Manage Trabajador_sindicato', 'url'=>array('admin')),
);
?>

<h1>Create Trabajador_sindicato</h1>




<?php $dataProvider=new CActiveDataProvider('nombre_modelo');

 $this->widget('zii.widgets.grid.CGridView', array(
    'dataProvider'=>$dataProvider,
 ));
 
 ?>