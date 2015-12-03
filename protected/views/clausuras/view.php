<?php
/* @var $this ClausurasController */
/* @var $model Clausuras */



$this->menu=array(
	array('label'=>'Listar Clausuras', 'url'=>array('index')),
	
	array('label'=>'Modificar Clausuras', 'url'=>array('update', 'id'=>$model->id)),
	
	array('label'=>'Buscar Clausuras', 'url'=>array('admin')),
);
?>

<h1>Ver Clausura #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
                array('name'=>'Convención',
                'value'=>$model->codConvencion->nombre,),
		'nro_clausura',
                array('name'=>'Tipo Clausura',
                'value'=>$model->tipoClausura->nombre_tipo_clausura,),
		array('name'=>'Sub-Tipo Clausura',
                'value'=>$model->subTipo->nombre_sub_tipo_clausura,),
		array('name'=>'Variable',
                'value'=>$model->idVariable->nombre_variable,),
		'valor',
	),
)); ?>
