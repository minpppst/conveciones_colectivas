<?php
/* @var $this TipoClausuraController */
/* @var $dataProvider CActiveDataProvider */



$this->menu=array(
	array('label'=>'Crear TipoClausura', 'url'=>array('create')),
	array('label'=>'Buscar TipoClausura', 'url'=>array('admin')),
);
?>

<h1>Tipo Clausuras</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
