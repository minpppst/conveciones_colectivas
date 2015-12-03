<?php
/* @var $this ResumenClausurasController */
/* @var $model ResumenClausuras */



$this->menu=array(
	array('label'=>'Listar Resumen Clausuras', 'url'=>array('index')),
	
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#resumen-clausuras-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Buscar Resumen Clausuras</h1>

<p>
Puedes Colocar Operadores de comparación (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>).
</p>

<?php echo CHtml::link('Busqueda Avanzada','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'resumen-clausuras-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'cod_convencion',
                array(
                'header'=>'Convencion',
                'name'=>'cod_convencion',
                'value'=>'$data->codConvencion->nombre',
                'htmlOptions'=>array('style'=>'text-align: center', 'with'=>'80px'),
                'filter'=>  ResumenClausuras::getListresumen(), 
                ),
		'cod_tipo',
                 array(
                'header'=>'Clausura',
                'name'=>'cod_tipo',
                'value'=>'$data->tipoclausuras->nombre_tipo_clausura',
                'htmlOptions'=>array('style'=>'text-align: center', 'with'=>'80px'),
                'filter'=>  ResumenClausuras::getListtipo(), 
                ),
                
		'cantidad',
		array(
                  'class'=>'CButtonColumn',
                  'template'=>'{view}{modificar}{delete}',
                  'htmlOptions'=>array('style'=>'width:75px'),
                  'buttons'=>array(
                   'modificar'=>array(
                        'label'=>'Mostrar Resumen Clausura',
                            'url'=> 'Yii::app()->controller->createUrl("resumenClausuras/create",array("convencion"=>$data->cod_convencion))',
                              'imageUrl'=>Yii::app()->request->baseUrl.'/images/iconos/lapiz.png',
                   ),
                  
                   'view' => array(
                         'label'=>'Ver Resumen Clausuras',
                            'url'=> 'Yii::app()->controller->createUrl("resumenClausuras/view",array("id"=>$data->id))',

                            
            
                                ),
                       'delete' => array(
                        'label'=>'Borrar Resumen Clausuras',
                        'visible' => '!Yii::app()->user->isGuest && Yii::app()->user->isSuperAdmin',
                        'url'=> 'Yii::app()->controller->createUrl("resumenClausuras/delete",array("id"=>$data->id,"convencion"=>$data->cod_convencion))',
                        //'options'=> array('confirm'=>$alert),
                           ),
                                ),
		),
	),
)); ?>
