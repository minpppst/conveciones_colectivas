<?php
/* @var $this Trabajador_sindicatoController */
/* @var $dataProvider CActiveDataProvider */



$this->menu=array(
	//array('label'=>'Create Trabajador_sindicato', 'url'=>array('create')),
	array('label'=>'Buscar Trabajador Nomina', 'url'=>array('admin')),
);
?>

<h1>Trabajador Sindicatos</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
