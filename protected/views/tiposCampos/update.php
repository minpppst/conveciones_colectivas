<?php
/* @var $this TiposCamposController */
/* @var $model TiposCampos */

$this->breadcrumbs=array(
	'Tipos Camposes'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List TiposCampos', 'url'=>array('index')),
	array('label'=>'Create TiposCampos', 'url'=>array('create')),
	array('label'=>'View TiposCampos', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage TiposCampos', 'url'=>array('admin')),
);
?>

<h1>Update TiposCampos <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>