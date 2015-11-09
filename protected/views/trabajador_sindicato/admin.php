<?php
/* @var $this Trabajador_sindicatoController */
/* @var $model Trabajador_sindicato */


$this->menu=array(
	array('label'=>'Listar Trabajador_sindicato', 'url'=>array('index')),
	//array('label'=>'Crear Trabajador_sindicato', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#trabajador-sindicato-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Buscar Nomina con Sindicato</h1>

<p>
Puedes Colocar Operadores de comparación. (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) 
</p>

<?php echo CHtml::link('Busqueda Avanzada','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'trabajador-sindicato-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'nomina_sindicato',
		//'trabajador',
		'secretario_general:boolean',
		'secretario_ejecutivo:boolean',
		'secretario_tesorero:boolean',
               
		/*
		'secretario_finanzas',
		'secretario_trabajo_reclamos',
		'secretario_cultura_deporte',
		'secretario_organizacion',
		'secretario_actas_correspondencias',
		'secretario_salud_laboral',
		'secretario_vigilancia_disciplina',
		'secretario_otro',
		'delegado_sindical',
		*/
		//array(
		//	'class'=>'CButtonColumn',
                            array(
  'class'=>'CButtonColumn',
  'template'=>'{view}{asociar}{nomina}',
  'htmlOptions'=>array('style'=>'width:75px'),
  'buttons'=>array(
   'asociar'=>array(
        'label'=>'Mostrar Nomina Y Relacion',
            'url'=> 'Yii::app()->controller->createUrl("trabajador_sindicato/create",array("convencion"=>$data->nomina_sindicato))',
              'imageUrl'=>Yii::app()->request->baseUrl.'/images/iconos/lapiz.png',
   ),
      'nomina'=>array(
        'label'=>'Empleado',
            'url'=> 'Yii::app()->controller->createUrl("nomina/update",array("id"=>$data->trabajador,"convencion"=>$data->nomina_sindicato))',
              'imageUrl'=>Yii::app()->request->baseUrl.'/images/iconos/lapiz1.png',
   ),
   'view' => array(
         'label'=>'[-]',
            'url'=> 'Yii::app()->controller->createUrl("trabajador_sindicato/view",array("id"=>$data->id))',
            
            'visible'=>'$data->id > 0',
            
  
 ),
 ),
		),
	),
)); ?>
