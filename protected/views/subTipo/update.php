<?php
/* @var $this SubTipoController */
/* @var $model SubTipo */

$this->breadcrumbs=array(
	'Sub Tipos'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List SubTipo', 'url'=>array('index')),
	array('label'=>'Create SubTipo', 'url'=>array('create')),
	array('label'=>'View SubTipo', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage SubTipo', 'url'=>array('admin')),
);
?>

<h1>Update SubTipo <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>