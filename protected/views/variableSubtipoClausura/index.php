<?php
/* @var $this VariableSubtipoClausuraController */
/* @var $dataProvider CActiveDataProvider */



$this->menu=array(
	array('label'=>'Crear VariableSubtipoClausura', 'url'=>array('create')),
	array('label'=>'Buscar VariableSubtipoClausura', 'url'=>array('admin')),
);
?>

<h1>Variable Subtipo Clausuras</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
