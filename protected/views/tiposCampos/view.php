<?php
/* @var $this TiposCamposController */
/* @var $model TiposCampos */

$this->breadcrumbs=array(
	'Tipos Camposes'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List TiposCampos', 'url'=>array('index')),
	array('label'=>'Create TiposCampos', 'url'=>array('create')),
	array('label'=>'Update TiposCampos', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete TiposCampos', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage TiposCampos', 'url'=>array('admin')),
);
?>

<h1>View TiposCampos #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'tipo',
	),
)); ?>
