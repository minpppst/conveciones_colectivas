<?php

/**
 * This is the model class for table "convencion".
 *
 * The followings are the available columns in table 'convencion':
 * @property string $id
 * @property string $nombre
 * @property string $numero_expediente
 * @property string $inspectoria
 * @property integer $sector
 * @property integer $ambito
 * @property integer $edicion
 * @property string $fecha_deposito
 * @property string $fecha_inicio
 * @property string $fecha_venc
 * @property integer $duracion_meses
 * @property string $fecha_auto_homo
 * @property string $costo_contrato
 * @property string $costo_contrato_sin_prestaciones
 * @property string $cod_convencion
 * @property string $referencia
 *
 * The followings are the available model relations:
 * @property Ambito $ambito0
 * @property Inspectoria $inspectoria0
 * @property Sector $sector0
 */
class Convencion extends CActiveRecord
{

    
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Convencion the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'convencion';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
                           $codigo="";
                            return array(
                        array('costo_contrato, costo_contrato_sin_prestaciones',  'validarambito'), 
			array('nombre, numero_expediente, inspectoria, sector, ambito, edicion, fecha_deposito, fecha_inicio, fecha_venc, duracion_meses, fecha_auto_homo,'.$codigo.' cod_convencion', 'required'),
			array('sector, ambito, edicion, duracion_meses', 'numerical', 'integerOnly'=>true),
			array('nombre', 'length', 'max'=>255),
			array('numero_expediente, costo_contrato, costo_contrato_sin_prestaciones', 'length', 'max'=>20),
			array('inspectoria', 'length', 'max'=>5),
			array('cod_convencion', 'length', 'max'=>11),
			array('referencia', 'length', 'max'=>15), 
                        array('cod_convencion', 'unique', 'attributeName'=>'cod_convencion'), 
                        // The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nombre, numero_expediente, inspectoria, sector, ambito, edicion, fecha_deposito, fecha_inicio, fecha_venc, duracion_meses, fecha_auto_homo, costo_contrato, costo_contrato_sin_prestaciones, cod_convencion, referencia', 'safe', 'on'=>'search'),
		);
                            
               
	//'costo_contrato', 'costo_contrato_sin_prestaciones',
                            
                            }
                            
                            
                            public function validarambito($atribute){
                               
                                if($this->ambito!=2 && (empty($this->costo_contrato) || empty($this->costo_contrato_sin_prestaciones))){
                               $this->addError($atribute,'Campos Costos Son Obligatorios, Cuando No Son Ambito Nacional.'); 
                               
                                
                                }    
                            }


                            
	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
            
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'ambito0' => array(self::BELONGS_TO, 'Ambito', 'ambito'),
			'inspectoria0' => array(self::BELONGS_TO, 'Inspectoria', 'inspectoria'),
                        'sector0' => array(self::BELONGS_TO, 'Sector', 'sector'),
		);
	}
        public static function getListInspectoria()
             {
             return CHtml::listData(Inspectoria::model()->findAll(),'id','inspectoria');
             }
             
             public static function getListSector()
             {
             return CHtml::listData(Sector::model()->findAll(),'id','nombre');
             }
             
             
              public static function getListAmbito()
             {
             return CHtml::listData(Ambito::model()->findAll(),'id','nombre_ambito');
             }

             
	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nombre' => 'Nombre',
			'numero_expediente' => 'Numero Expediente',
			'inspectoria' => 'Inspectoria',
			'sector' => 'Sector',
			'ambito' => 'Ambito',
			'edicion' => 'Edicion',
			'fecha_deposito' => 'Fecha De Deposito',
			'fecha_inicio' => 'Fecha De Inicio',
			'fecha_venc' => 'Fecha De Venc.',
			'duracion_meses' => 'Duracion En Meses',
			'fecha_auto_homo' => 'Fecha Homologación',
			'costo_contrato' => 'Costo Del Contrato',
			'costo_contrato_sin_prestaciones' => 'Costo Del Contrato Sin Prestaciones',
			'cod_convencion' => 'Cod Convencion',
			'referencia' => 'Referencia',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;
                
                
		$criteria->compare('id',$this->id,true);
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('numero_expediente',$this->numero_expediente,true);
		//$criteria->compare('inspectoria',$this->inspectoria,true);
		$criteria->compare('sector',$this->sector);
		$criteria->compare('ambito',$this->ambito);
		$criteria->compare('edicion',$this->edicion);
		$criteria->compare('fecha_deposito',$this->fecha_deposito,true);
		$criteria->compare('fecha_inicio',$this->fecha_inicio,true);
		$criteria->compare('fecha_venc',$this->fecha_venc,true);
		$criteria->compare('duracion_meses',$this->duracion_meses);
		$criteria->compare('fecha_auto_homo',$this->fecha_auto_homo,true);
		$criteria->compare('costo_contrato',$this->costo_contrato,true);
		$criteria->compare('costo_contrato_sin_prestaciones',$this->costo_contrato_sin_prestaciones,true);
		$criteria->compare('cod_convencion',$this->cod_convencion,true);
		$criteria->compare('referencia',$this->referencia,true);
                $criteria->with[]='inspectoria0';
                $criteria->addSearchCondition('inspectoria0.id',$this->inspectoria,true); 

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	
                
        }
        
        
        public function behaviors()
                {
                    return array(
                        // Classname => path to Class
                        'ActiveRecordLogableBehavior'=>
                            'application.behaviors.ActiveRecordLogableBehavior',
                    );
                }
        
        
}