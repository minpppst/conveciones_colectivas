<?php
/* @var $this TipoClausuraController */
/* @var $model TipoClausura */



$this->menu=array(
	array('label'=>'Listar TipoClausura', 'url'=>array('index')),
	array('label'=>'Crear TipoClausura', 'url'=>array('create')),
	array('label'=>'Modificar TipoClausura', 'url'=>array('update', 'id'=>$model->id)),
	//array('label'=>'Delete TipoClausura', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Buscar TipoClausura', 'url'=>array('admin')),
);
?>

<h1>Ver TipoClausura #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'nombre_tipo_clausura',
	),
)); ?>
