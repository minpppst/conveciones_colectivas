<?php
/* @var $this NominaController */
/* @var $dataProvider CActiveDataProvider */



$this->menu=array(
	//array('label'=>'Crear Nomina', 'url'=>array('create')),
	array('label'=>'Buscar Nomina-Sindicato', 'url'=>array('admin')),
        //array('label'=>'Buscar Nomina', 'url'=>array('admin')),
);
?>

<h1>Nominas</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
