<?php
/* @var $this SubTipoController */
/* @var $dataProvider CActiveDataProvider */



$this->menu=array(
	array('label'=>'Crear SubTipo', 'url'=>array('create')),
	array('label'=>'Buscar SubTipo', 'url'=>array('admin')),
);
?>

<h1>Sub Tipos</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
