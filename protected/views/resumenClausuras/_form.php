<?php
/* @var $this ResumenClausurasController */
/* @var $model ResumenClausuras */
/* @var $form CActiveForm */
?>

<?php
    Yii::app()->clientScript->registerScript('helloscript',"
       js:{contador=1;
            datos= new Array();
            suma=0;
            while(document.getElementById(contador)!=null)
            {
            datos[contador]=document.getElementById(contador).value;
            suma+=parseInt(document.getElementById(contador).value);
            contador++;
            }
            document.getElementById('datos').value =datos.slice();
           document.getElementById('total').value=(suma);}
    ",CClientScript::POS_READY);
?>





<div class="form">

    
    
<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'resumen-clausuras-form',
	'enableAjaxValidation'=>false,
)); ?>

	
<?php $this->endWidget(); ?>

        
        
        <?php
        
        
         $this->widget('zii.widgets.grid.CGridView', array(
            'dataProvider'=>$dataProvider,
            
            //'dataProvider'=>$dataProvider_cargos,
            'id'=>'show-list',
            'columns'=>array(
             array(
            'header'=>'Nro.',
            'value'=>'$this->grid->dataProvider->pagination->currentPage * $this->grid->dataProvider->pagination->pageSize + ($row+1)',
                  'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        ),
                
                
            array('name'=>'nombre_tipo_clausura','value'=>'$data->nombre_tipo_clausura',//'$data["cedula"]', //print_r($dataProvider),// * $dataProvider->pagination->pageSize + ($contador+1),
              'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
                 'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
                
         ),
                
         
                 array('name'=>'Cantidad De Clausuras',
                    'value'=>'CHtml::textField("$data->id",$data->buscar_cantidad($data->id,'.$_GET['convencion'].'),array
                    ("style"=>"width:20px;text-align:center;"))',
                    'type'=>'raw',
                     'htmlOptions'=>array('width'=>2,  'style'=>'text-align: center;', 'onchange'=>'js:{
                        contador=1;
                        datos= new Array();
                        suma=0;
                        while(document.getElementById(contador)!=null)
                        {
                        datos[contador]=document.getElementById(contador).value;
                        suma+=parseInt(document.getElementById(contador).value);
                        contador++;
                        }
                        document.getElementById("datos").value =datos.slice();
                       document.getElementById("total").value=(suma);

                       }'
                     ),
                      
                     

                    ),
                
                
                
               
                
                
                
                
         )));
        ?>
    <div class="row">
    <?php echo CHtml::hiddenField('datos[]' , '', array('id' => 'datos')); ?>
<?php echo CHtml::hiddenField('convencion_resumen' , $_GET['convencion'], array('id' => 'convencion_resumen')); ?>
        <?php echo "<table border='1' ><tr > <td colspan='1' width='75%' style='text-align: right;'><b style='vertical-align: middle;'>Total</b></td>  <td bgcolor='#3E7ACE'>".CHtml::TextField('Total' , '0', array('id' => 'total', 'maxlenth'=>'5', 'size'=>'5', 'style'=>' text-align: center; vertical-align: top;'))."</td><td width='15%'></td></tr></table>" ?>
    </div>
    
    <div>
        <?php
         echo CHtml::ajaxButton("Guardar", $this->createUrl('/ResumenClausuras/Guardar_resumen'), array(
        "type" => "post",
        "data" => 'js:{datos : $("#datos").val(), convencion : $("#convencion_resumen").val() 
         }',
        "success" => 'js:alert("Se Han Realizado Los Cambios") ','js:document.location.reload()'//array(
        )
        );
      
      
        ?>
        </div>
        
</div><!-- form -->