<?php
/* @var $this ClausurasController */
/* @var $model Clausuras */

$this->breadcrumbs=array(
	'Clausurases'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Clausuras', 'url'=>array('index')),
	array('label'=>'Create Clausuras', 'url'=>array('create')),
	array('label'=>'Update Clausuras', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Clausuras', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Clausuras', 'url'=>array('admin')),
);
?>

<h1>View Clausuras #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'numero_clausura',
		'descripcion_clausura',
		'cod_convencion',
	),
)); ?>
