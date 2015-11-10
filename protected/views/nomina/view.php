<?php
/* @var $this NominaController */
/* @var $model Nomina */

$this->breadcrumbs=array(
	'Nominas'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'Listar Nomina', 'url'=>array('index')),
	//array('label'=>'Create Nomina', 'url'=>array('create')),
	array('label'=>'Modificar Nomina', 'url'=>array('create', 'id'=>$model->id)),
	//array('label'=>'Delete Nomina', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Buscar Nomina', 'url'=>array('admin')),
);
?>

<h1>View Nomina #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'nombres',
		
		'nacionalidad',
		'pais_origen',
		'lugar_nacimiento',
		'sexo',
		'edad',
		'estado_civil',
		'nivel_educativo',
		'grado_anio_aprobado',
		'oficio_dentro_establecimiento',
		'codigo_ocupacion',
		'tiempo_serv_establecimiento_anios',
		'tiempo_serv_establecimiento_meses',
		'tiempo_ejerciendo_profesion_anios',
		'tiempo_ejerciendo_profesion_meses',
		'remuneracion_antes_contra_empleado',
		'remuneracion_antes_contra_obrero',
		'remuneracion_despues_contra_empleado',
		'remuneracion_despues_contra_obrero',
		'carga_familiar',
		'cod_convencion',
	),
)); ?>
