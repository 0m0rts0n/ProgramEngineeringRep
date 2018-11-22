using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HospitalASP;

namespace HospitalASP.Controllers
{
    public class DrugsController : Controller
    {
        private HospitalDBEntities db = new HospitalDBEntities();

        // GET: Drugs
        public ActionResult Index()
        {
            var drugs = db.Drugs.Include(d => d.DrugProvider);
            return View(drugs.ToList());
        }

        // GET: Drugs/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Drug drug = db.Drugs.Find(id);
            if (drug == null)
            {
                return HttpNotFound();
            }
            return View(drug);
        }

        // GET: Drugs/Create
        public ActionResult Create()
        {
            ViewBag.DrugProviderID = new SelectList(db.DrugProviders, "DrugProviderID", "ProviderName");
            return View();
        }

        // POST: Drugs/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "DrugID,DrugProviderID,DrugName,DrugPurpose,IsPrescriptionAllowed")] Drug drug)
        {
            if (ModelState.IsValid)
            {
                drug.DrugID = Guid.NewGuid();
                db.Drugs.Add(drug);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DrugProviderID = new SelectList(db.DrugProviders, "DrugProviderID", "ProviderName", drug.DrugProviderID);
            return View(drug);
        }

        // GET: Drugs/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Drug drug = db.Drugs.Find(id);
            if (drug == null)
            {
                return HttpNotFound();
            }
            ViewBag.DrugProviderID = new SelectList(db.DrugProviders, "DrugProviderID", "ProviderName", drug.DrugProviderID);
            return View(drug);
        }

        // POST: Drugs/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DrugID,DrugProviderID,DrugName,DrugPurpose,IsPrescriptionAllowed")] Drug drug)
        {
            if (ModelState.IsValid)
            {
                db.Entry(drug).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DrugProviderID = new SelectList(db.DrugProviders, "DrugProviderID", "ProviderName", drug.DrugProviderID);
            return View(drug);
        }

        // GET: Drugs/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Drug drug = db.Drugs.Find(id);
            if (drug == null)
            {
                return HttpNotFound();
            }
            return View(drug);
        }

        // POST: Drugs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Drug drug = db.Drugs.Find(id);
            db.Drugs.Remove(drug);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
