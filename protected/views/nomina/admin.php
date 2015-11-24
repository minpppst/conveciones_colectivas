<?php
/* @var $this NominaController */
/* @var $model Nomina */

$this->breadcrumbs=array(
	
);

$this->menu=array(
	array('label'=>'Listar Nomina', 'url'=>array('index')),
	//array('label'=>'Crear Nomina', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#nomina-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Buscar Nominas</h1>
<?php 
 $alert = '¿Esta Seguro De Borrar La Nomina y Dejar La Convencion Sin Nomina?';
?>
<p>
Puedes Colocar Operadores de comparación (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>)
</p>

<?php echo CHtml::link('Busqueda Avazanda','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'nomina-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
            
		'nombres',
		'nacionalidad',
		'pais_origen',
		'lugar_nacimiento',
            array(
                'header'=>'Convencion',
                'name'=>'cod_convencion',
                'value'=>'$data->codConvencion->nombre',
                'htmlOptions'=>array('style'=>'text-align: center', 'with'=>'80px'),
                'filter'=>Chtml::listData(Convencion::model()->findAll(), 'id','nombre'),
                ),
		/*
		'sexo',
		'edad',
		'estado_civil',
		'nivel_educativo',
		'grado_anio_aprobado',
		'oficio_dentro_establecimiento',
		'codigo_ocupacion',
		'tiempo_serv_establecimiento_anios',
		'tiempo_serv_establecimiento_meses',
		'tiempo_ejerciciendo_prefesion_anios',
		'tiempo_ejerciendo_profesion_meses',
		'remuneracion_antes_contra_empleado',
		'remuneracion_antes_contra_obrero',
		'remuneracion_despues_contra_empleado',
		'remuneracion_despues_contra_obrero',
		'carga_familiar',
		'cod_convencion',
		*/
//		array(
//			'class'=>'CButtonColumn',
//		),
            array(
                  'class'=>'CButtonColumn',
                  'template'=>'{view}{asociar}{nomina}{delete}',
                  'htmlOptions'=>array('style'=>'width:75px'),
                  'buttons'=>array(
                   'asociar'=>array(
                        'label'=>'Mostrar Nomina Y Cargo Sindicato',
                            'url'=> 'Yii::app()->controller->createUrl("nomina/create_cargo_sindicato",array("convencion"=>$data->cod_convencion))',
                              'imageUrl'=>Yii::app()->request->baseUrl.'/images/iconos/lapiz.png',
                   ),
                  'nomina'=>array(
                    'label'=>'Modificar Empleado',
                        'url'=> 'Yii::app()->controller->createUrl("nomina/update",array("id"=>$data->cedula,"convencion"=>$data->cod_convencion))',
                          'imageUrl'=>Yii::app()->request->baseUrl.'/images/iconos/lapiz1.png',
                            ),
                   'view' => array(
                         'label'=>'Ver Nomina',
                            'url'=> 'Yii::app()->controller->createUrl("nomina/view",array("id"=>$data->id))',

                            
            
                                ),
                       'delete' => array(
                        'label'=>'Borrar Nomina-Sindicato',
                        'visible' => '!Yii::app()->user->isGuest && Yii::app()->user->isSuperAdmin',
                        'url'=> 'Yii::app()->controller->createUrl("nomina/delete",array("id"=>$data->cedula,"convencion"=>$data->cod_convencion))',
                        //'options'=> array('confirm'=>$alert),
                           ),
                                ),
		),
            
	),
)); ?>
