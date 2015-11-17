<?php
/* @var $this ClausurasController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Clausurases',
);

$this->menu=array(
	array('label'=>'Create Clausuras', 'url'=>array('create')),
	array('label'=>'Manage Clausuras', 'url'=>array('admin')),
);
?>

<h1>Clausurases</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
