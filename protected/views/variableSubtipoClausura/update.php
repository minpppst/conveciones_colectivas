<?php
/* @var $this VariableSubtipoClausuraController */
/* @var $model VariableSubtipoClausura */

$this->breadcrumbs=array(
	'Variable Subtipo Clausuras'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List VariableSubtipoClausura', 'url'=>array('index')),
	array('label'=>'Create VariableSubtipoClausura', 'url'=>array('create')),
	array('label'=>'View VariableSubtipoClausura', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage VariableSubtipoClausura', 'url'=>array('admin')),
);
?>

<h1>Update VariableSubtipoClausura <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>