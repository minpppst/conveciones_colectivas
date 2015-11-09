<?php
/* @var $this Trabajador_sindicatoController */
/* @var $model Trabajador_sindicato */



$this->menu=array(
	array('label'=>'Listar Trabajador Nomina', 'url'=>array('index')),
	//array('label'=>'Crear Trabajador_sindicato', 'url'=>array('create')),
	//array('label'=>'Modificar Trabajador Nomina', 'url'=>array('update', 'id'=>$model->id)),
	//array('label'=>'Borrar Trabajador_sindicato', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Buscar Trabajador Nomina', 'url'=>array('admin')),
);
?>

<h1>View Trabajador Nomina #<?php echo $model->id; ?></h1>
<?php //$this->widget('zii.widgets.CListView', array(
//	'dataProvider'=>$dataProvider,
//	'itemView'=>'_view',
//)); 
 $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
	//	'nomina_sindicato',
       
		'trabajador',
            array('name'=>'nomina_sindicato',
                'value'=>$model->nominaSindicato->nombre,),
		'secretario_general:boolean',
		'secretario_ejecutivo:boolean',
		'secretario_tesorero:boolean',
		'secretario_finanzas:boolean',
		'secretario_trabajo_reclamos:boolean',
		'secretario_cultura_deporte:boolean',
		'secretario_organizacion:boolean',
		'secretario_actas_correspondencias:boolean',
		'secretario_salud_laboral:boolean',
		'secretario_vigilancia_disciplina:boolean',
		'secretario_otro:boolean',
		'delegado_sindical:boolean',
	),
)); 
    ?>
