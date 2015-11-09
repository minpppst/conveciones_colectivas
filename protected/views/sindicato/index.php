<?php
/* @var $this SindicatoController */
/* @var $dataProvider CActiveDataProvider */


$this->menu=array(
	//array('label'=>'Crear Sindicato', 'url'=>array('create')),
	array('label'=>'Buscar Sindicato', 'url'=>array('admin')),
);
?>

<h1>Sindicatos</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
