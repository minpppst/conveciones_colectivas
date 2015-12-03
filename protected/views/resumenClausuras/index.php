<?php
/* @var $this ResumenClausurasController */
/* @var $dataProvider CActiveDataProvider */



$this->menu=array(
	
	array('label'=>'Buscar Resumen Clausuras', 'url'=>array('admin')),
);
?>

<h1>Resumen Clausuras</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
