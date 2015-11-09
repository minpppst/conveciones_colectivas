<?php
/* @var $this ConvencionController */
/* @var $dataProvider CActiveDataProvider */



$this->menu=array(
	//array('label'=>'Listar Convenciones', 'url'=>array('index')),
	array('label'=>'Buscar Convencion', 'url'=>array('admin')),
         array('label'=>'Ordenar Relaciones', 'url'=>array('ordenar_convenciones')),
);
?>

<h1>Convenciones</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
