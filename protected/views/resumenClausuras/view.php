<?php
/* @var $this ResumenClausurasController */
/* @var $model ResumenClausuras */



$this->menu=array(
	array('label'=>'Listar Resumen Clausuras', 'url'=>array('index')),
	
	
	//array('label'=>'Delete ResumenClausuras', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Buscar Resumen Clausuras', 'url'=>array('admin')),
);
?>

<h1>Ver Resumen Clausuras #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		
		array('name'=>'Convencion',
                'value'=>$model->codConvencion->nombre,),
                array('name'=>'Tipo Clausura',
                'value'=>$model->tipoclausuras->nombre_tipo_clausura,),
		'cantidad',
	),
)); ?>
