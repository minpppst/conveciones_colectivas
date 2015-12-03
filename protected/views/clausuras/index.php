<?php
/* @var $this ClausurasController */
/* @var $dataProvider CActiveDataProvider */



$this->menu=array(
	
	array('label'=>'Buscar Clausuras', 'url'=>array('admin')),
        array('label'=>'Tipo Clausuras', 'url'=>array('tipoclausura/index')),
        array('label'=>'Sub Tipo Clausuras', 'url'=>array('subtipo/index')),
        array('label'=>'Campos Sub-Tipo', 'url'=>array('variableSubtipoClausura/index')),
);
?>

<h1>Clausuras</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
