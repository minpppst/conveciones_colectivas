<?php
/* @var $this ClausurasController */
/* @var $model Clausuras */

$this->breadcrumbs=array(
	'Clausurases'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Clausuras', 'url'=>array('index')),
	array('label'=>'Manage Clausuras', 'url'=>array('admin')),
);
?>

<h1>Create Clausuras</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>