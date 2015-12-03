<?php
/* @var $this TiposCamposController */
/* @var $model TiposCampos */

$this->breadcrumbs=array(
	'Tipos Camposes'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List TiposCampos', 'url'=>array('index')),
	array('label'=>'Manage TiposCampos', 'url'=>array('admin')),
);
?>

<h1>Create TiposCampos</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>