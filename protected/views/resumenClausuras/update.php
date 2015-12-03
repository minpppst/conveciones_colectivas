<?php
/* @var $this ResumenClausurasController */
/* @var $model ResumenClausuras */

$this->breadcrumbs=array(
	'Resumen Clausurases'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List ResumenClausuras', 'url'=>array('index')),
	array('label'=>'Create ResumenClausuras', 'url'=>array('create')),
	array('label'=>'View ResumenClausuras', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage ResumenClausuras', 'url'=>array('admin')),
);
?>

<h1>Update ResumenClausuras <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>