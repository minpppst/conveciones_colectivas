<?php
/* @var $this TiposCamposController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Tipos Camposes',
);

$this->menu=array(
	array('label'=>'Create TiposCampos', 'url'=>array('create')),
	array('label'=>'Manage TiposCampos', 'url'=>array('admin')),
);
?>

<h1>Tipos Camposes</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
