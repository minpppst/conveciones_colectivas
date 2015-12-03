<?php
/* @var $this ResumenClausurasController */
/* @var $model ResumenClausuras */



$this->menu=array(
	array('label'=>'Listar Resumen Clausuras', 'url'=>array('index')),
	array('label'=>'Buscar Resumen Clausuras', 'url'=>array('admin')),
);
?>

<h1>Crear un Resumen de Clausuras</h1>

<?php echo $this->renderPartial('_form', array('dataProvider'=>$dataProvider, 'convencion'=>'8')); ?>