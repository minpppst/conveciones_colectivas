<?php
/* @var $this ConvencionController */
/* @var $model Convencion */



$this->menu=array(
	array('label'=>'Listar Convencion', 'url'=>array('index')),
	//array('label'=>'Create Convencion', 'url'=>array('create')),
	array('label'=>'Modificar Convencion', 'url'=>array('update', 'id'=>$model->id)),
	//array('label'=>'Delete Convencion', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Buscar Convencion', 'url'=>array('admin')),
);
?>

<h1>Ver Convencion #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'nombre',
		'numero_expediente',
		//'inspectoria',
                array('name'=>'Inspectoria',
                'value'=>$model->inspectoria0->inspectoria,),
		array('name'=>'Sector',
                'value'=>$model->sector==1? 'Público':'Privado',),
		array('name'=>'Ambito',
                'value'=>$model->ambito0->nombre_ambito,),
		'edicion',
		'fecha_deposito',
		'fecha_inicio',
		'fecha_venc',
		'duracion_meses',
		'fecha_auto_homo',
		'costo_contrato',
		'costo_contrato_sin_prestaciones',
		'cod_convencion',
		
	),
 
)); ?>
