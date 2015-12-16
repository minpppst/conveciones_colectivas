<?php
/* @var $this ClausurasController */
/* @var $dataProvider CActiveDataProvider */



$this->menu=array(
	
	array('label'=>'Buscar Clausuras', 'url'=>array('admin')),
        array('label'=>'Tipo Clausuras', 'url'=>array('tipoclausura/index'),'visible'=>Yii::app()->user->isSuperAdmin),
        array('label'=>'Sub Tipo Clausuras', 'url'=>array('subtipo/index'),'visible'=>Yii::app()->user->isSuperAdmin),
        array('label'=>'Campos Sub-Tipo', 'url'=>array('variableSubtipoClausura/index'),'visible'=>Yii::app()->user->isSuperAdmin),
);
?>

<h1>Clausuras</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
