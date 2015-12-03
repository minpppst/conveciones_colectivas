<?php
/* @var $this ClausurasController */
/* @var $model Clausuras */

$this->breadcrumbs=array(
	'Clausurases'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Clausuras', 'url'=>array('index')),
	array('label'=>'Create Clausuras', 'url'=>array('create')),
	array('label'=>'View Clausuras', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Clausuras', 'url'=>array('admin')),
);
?>

<h1>Update Clausuras <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>